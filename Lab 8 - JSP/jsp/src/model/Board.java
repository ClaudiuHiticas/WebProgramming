package model;

public class Board {
    private Integer[][] board;
    public Integer shipsAdded;

    public Board() {
        this.board = new Integer[6][6];
        for (int i = 0; i < 6; ++i) {
            for (int j = 0; j < 6; ++j) {
                this.board[i][j] = 0;
            }
        }
        this.shipsAdded = 0;
    }

    public Integer getForPosition(Integer x, Integer y) {
        return this.board[x][y];
    }

    public void addShip(Integer x, Integer y, Integer orientation) {
        int[] nextX = {-1, 0, 1, 0};
        int[] nextY = {0, -1, 0, 1};
        int currentX = x;
        int currentY = y;

        for (int i = 0; i < 3; ++i) {
            this.board[currentX][currentY] = 1;
            currentX += nextX[orientation];
            currentY += nextY[orientation];
        }

         this.shipsAdded += 1;
    }

    public void attack(Integer x, Integer y) {
        this.board[x][y] += 2;
    }
}
